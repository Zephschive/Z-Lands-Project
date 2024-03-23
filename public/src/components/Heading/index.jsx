import React from "react";

const sizes = {
  "3xl": "text-[28px] font-extrabold",
  "2xl": "text-2xl font-semibold",
  xl: "text-[23px] font-semibold",
  "5xl": "text-4xl font-bold",
  "4xl": "text-[34px] font-bold",
  s: "text-sm font-semibold",
  md: "text-[21px] font-semibold",
  "6xl": "text-[62px] font-bold",
  xs: "text-[13px] font-semibold",
  lg: "text-[22px] font-semibold",
};

const Heading = ({ children, className = "", size = "xs", as, ...restProps }) => {
  const Component = as || "h6";

  return (
    <Component className={`text-black-900 font-sofiapro ${className} ${sizes[size]}`} {...restProps}>
      {children}
    </Component>
  );
};

export { Heading };
