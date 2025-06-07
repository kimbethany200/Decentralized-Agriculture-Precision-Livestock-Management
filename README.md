# Decentralized Agriculture Precision Livestock Management

A comprehensive blockchain-based livestock management system built with Clarity smart contracts for the Stacks blockchain. This system provides farmers with tools to manage their livestock operations including animal tracking, health monitoring, feed optimization, and breeding management.

## 🚀 Features

### Core Contracts

1. **Farmer Verification Contract** (`farmer-verification.clar`)
    - Register and verify livestock farmers
    - Manage farmer credentials and farm information
    - Ensure only verified farmers can access the system

2. **Animal Tracking Contract** (`animal-tracking.clar`)
    - Track individual livestock animals
    - Maintain comprehensive animal records
    - Record animal history and status changes

3. **Health Monitoring Contract** (`health-monitoring.clar`)
    - Monitor livestock health status
    - Track veterinary records and treatments
    - Generate health alerts for abnormal conditions

4. **Feed Optimization Contract** (`feed-optimization.clar`)
    - Create and manage feed programs
    - Track feed consumption and costs
    - Calculate feed efficiency metrics

5. **Breeding Management Contract** (`breeding-management.clar`)
    - Manage livestock breeding programs
    - Track breeding records and offspring
    - Calculate breeding success rates

## 🏗️ Architecture

The system follows a modular architecture where each contract handles a specific aspect of livestock management:

\`\`\`
┌─────────────────────┐
│ Farmer Verification │
└──────────┬──────────┘
│
┌──────▼──────┐
│   Animal    │
│  Tracking   │
└──────┬──────┘
│
┌──────▼──────┐    ┌─────────────────┐    ┌─────────────────┐
│   Health    │    │      Feed       │    │    Breeding     │
│ Monitoring  │    │  Optimization   │    │   Management    │
└─────────────┘    └─────────────────┘    └─────────────────┘
\`\`\`

## 🛠️ Installation

1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/your-repo/livestock-management
   cd livestock-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## 📋 Usage

### Farmer Registration

1. Register as a farmer:
   \`\`\`clarity
   (contract-call? .farmer-verification register-farmer "John Doe" "Farm Valley, State" u100)
   \`\`\`

2. Get verification from contract owner:
   \`\`\`clarity
   (contract-call? .farmer-verification verify-farmer u1)
   \`\`\`

### Animal Management

1. Add a new animal:
   \`\`\`clarity
   (contract-call? .animal-tracking add-animal u1 "cattle" "Holstein" u20240101 "female" u450 "Pasture A")
   \`\`\`

2. Update animal status:
   \`\`\`clarity
   (contract-call? .animal-tracking update-animal-status u1 "pregnant")
   \`\`\`

### Health Monitoring

1. Add health record:
   \`\`\`clarity
   (contract-call? .health-monitoring add-health-record u1 u385 u470 "healthy" "" "" u20240201)
   \`\`\`

2. Create health alert:
   \`\`\`clarity
   (contract-call? .health-monitoring create-health-alert u1 "medium" "Requires vaccination")
   \`\`\`

### Feed Management

1. Create feed program:
   \`\`\`clarity
   (contract-call? .feed-optimization create-feed-program u1 "High Protein" "cattle" "grain-mix" u25 u250 u85)
   \`\`\`

2. Assign program to animal:
   \`\`\`clarity
   (contract-call? .feed-optimization assign-feed-program u1 u1 u550)
   \`\`\`

### Breeding Management

1. Record breeding event:
   \`\`\`clarity
   (contract-call? .breeding-management record-breeding u1 u2 u3 u20240115 u20240415 "artificial" "First breeding attempt")
   \`\`\`

2. Record offspring:
   \`\`\`clarity
   (contract-call? .breeding-management record-offspring u1 u4 u20240420 u42 "male" "healthy")
   \`\`\`

## 🧪 Testing

The project includes comprehensive tests for all contracts using Vitest:

- `farmer-verification.test.ts` - Tests farmer registration and verification
- `animal-tracking.test.ts` - Tests animal management functions
- `health-monitoring.test.ts` - Tests health tracking and alerts
- `feed-optimization.test.ts` - Tests feed program management
- `breeding-management.test.ts` - Tests breeding record management

Run tests with:
\`\`\`bash
npm test
\`\`\`

## 📊 Data Models

### Farmer
- farmer-id: uint
- address: principal
- name: string-ascii
- location: string-ascii
- verified: bool
- registration-date: uint
- farm-size: uint

### Animal
- animal-id: uint
- farmer-id: uint
- species: string-ascii
- breed: string-ascii
- birth-date: uint
- gender: string-ascii
- weight: uint
- status: string-ascii
- location: string-ascii

### Health Record
- animal-id: uint
- record-id: uint
- timestamp: uint
- temperature: uint
- weight: uint
- health-status: string-ascii
- symptoms: string-ascii
- treatment: string-ascii
- veterinarian: principal
- next-checkup: uint

## 🔒 Security Features

- **Access Control**: Only verified farmers can perform operations
- **Data Integrity**: Immutable blockchain records
- **Audit Trail**: Complete history of all operations
- **Validation**: Input validation and error handling

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue on GitHub
- Contact the development team
- Check the documentation

## 🗺️ Roadmap

- [ ] Mobile app integration
- [ ] IoT sensor integration
- [ ] Advanced analytics dashboard
- [ ] Multi-language support
- [ ] Integration with agricultural marketplaces
- [ ] Weather data integration
- [ ] Automated alert systems
- [ ] Blockchain interoperability

---

Built with ❤️ for the agricultural community using Stacks blockchain technology.
