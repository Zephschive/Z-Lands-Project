// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import {getFirestore } from "firebase/firestore";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCxRZUS2Hk6wOBwALHAFwWm3akHA7cJRZ0",
  authDomain: "zlands-final-year-project.firebaseapp.com",
  projectId: "zlands-final-year-project",
  storageBucket: "zlands-final-year-project.appspot.com",
  messagingSenderId: "386412573702",
  appId: "1:386412573702:web:59fb77ccd2e4c70b0dff87",
  measurementId: "G-K5MS1X4CLV"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const db = getFirestore(app);
export const auth = getAuth();

export default app;