const admin = require("firebase-admin");
const fs = require("fs");

// Initialize Firebase Admin SDK
const serviceAccount = require("./serviceAccount.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

// Load JSON file
const rawData = fs.readFileSync("./products.json");
const products = JSON.parse(rawData);

// Upload data to Firestore
async function uploadData() {
  const collectionRef = db.collection("products");

  for (const key in products) {
    await collectionRef.doc(products[key].id.toString()).set(products[key]);
  }
  console.log("✅ Data imported successfully!");
}

uploadData().catch(console.error);
