;; Farmer Verification Contract
;; Validates and manages livestock farmers

(define-map farmers
  { farmer-id: uint }
  {
    address: principal,
    name: (string-ascii 50),
    location: (string-ascii 100),
    verified: bool,
    registration-date: uint,
    farm-size: uint
  }
)

(define-map farmer-by-address
  { address: principal }
  { farmer-id: uint }
)

(define-data-var next-farmer-id uint u1)
(define-data-var contract-owner principal tx-sender)

;; Register a new farmer
(define-public (register-farmer (name (string-ascii 50)) (location (string-ascii 100)) (farm-size uint))
  (let ((farmer-id (var-get next-farmer-id)))
    (asserts! (is-none (map-get? farmer-by-address { address: tx-sender })) (err u100))
    (map-set farmers
      { farmer-id: farmer-id }
      {
        address: tx-sender,
        name: name,
        location: location,
        verified: false,
        registration-date: block-height,
        farm-size: farm-size
      }
    )
    (map-set farmer-by-address { address: tx-sender } { farmer-id: farmer-id })
    (var-set next-farmer-id (+ farmer-id u1))
    (ok farmer-id)
  )
)

;; Verify a farmer (only contract owner)
(define-public (verify-farmer (farmer-id uint))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u101))
    (match (map-get? farmers { farmer-id: farmer-id })
      farmer-data
      (begin
        (map-set farmers
          { farmer-id: farmer-id }
          (merge farmer-data { verified: true })
        )
        (ok true)
      )
      (err u102)
    )
  )
)

;; Get farmer info
(define-read-only (get-farmer (farmer-id uint))
  (map-get? farmers { farmer-id: farmer-id })
)

;; Check if farmer is verified
(define-read-only (is-farmer-verified (farmer-address principal))
  (match (map-get? farmer-by-address { address: farmer-address })
    farmer-ref
    (match (map-get? farmers { farmer-id: (get farmer-id farmer-ref) })
      farmer-data (get verified farmer-data)
      false
    )
    false
  )
)
