import React from "react";
import { createRoot } from "react-dom/client";
import App from "./App";
import "../src/styles/tailwind.css";
import "../src/styles/index.css";
import "../src/styles/font.css";

const container = document.getElementById("root");
const root = createRoot(container);

root.render(<App />);
