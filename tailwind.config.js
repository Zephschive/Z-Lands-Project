module.exports = {
  mode: "jit",
  content: ["./src/**/**/*.{js,ts,jsx,tsx,html,mdx}", "./src/**/*.{js,ts,jsx,tsx,html,mdx}"],
  darkMode: "class",
  theme: {
    screens: { md: { max: "1050px" }, sm: { max: "550px" } },
    extend: {
      colors: {
        white: { A700: "#ffffff", A700_7a: "#ffffff7a" },
        blue: { A200: "#4285f4" },
        blue_gray: { 100: "#d9d9d9", "100_8c": "#d9d9d98c" },
        gray: { 900: "#120d1e", "900_01": "#150939" },
        black: { 900: "#000000", "900_6b": "#0000006b" },
        green: { A400: "#00df76" },
        deep_purple: { A700: "#4300f9" },
      },
      boxShadow: {
        xs: "0px 4px  16px 19px #0000003f",
        sm: "0px 4px  16px 0px #0000003f",
        md: "0px 4px  41px 12px #0000003f",
        lg: "0px 4px  42px 8px #0000003f",
      },
      fontFamily: { sofiapro: "Sofia Pro", jockeyone: "Jockey One", karla: "Karla" },
      textShadow: { ts: "0px 4px  4px #0000003f", ts1: "0px 4px  16px #0000003f" },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
