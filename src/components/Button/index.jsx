import React from "react";
import PropTypes from "prop-types";

const shapes = {
  round: "rounded-[25px]",
};
const variants = {
  fill: {
    blue_A200: "bg-blue-A200 shadow-xs text-white-A700",
  },
};
const sizes = {
  xs: "h-[59px] px-[35px] text-4xl",
};

const Button = ({
  children,
  className = "",
  leftIcon,
  rightIcon,
  shape = "",
  variant = "fill",
  size = "xs",
  color = "blue_A200",
  ...restProps
}) => {
  return (
    <button
      className={`${className} flex items-center justify-center self-center text-center cursor-pointer text-white-A700 text-4xl font-semibold bg-blue-A200 shadow-xs min-w-[395px] rounded-[25px] ${(shape && shapes[shape]) || ""} ${(size && sizes[size]) || ""} ${(variant && variants[variant]?.[color]) || ""}`}
      {...restProps}
    >
      {!!leftIcon && leftIcon}
      {children}
      {!!rightIcon && rightIcon}
    </button>
  );
};

Button.propTypes = {
  className: PropTypes.string,
  children: PropTypes.node,
  leftIcon: PropTypes.node,
  rightIcon: PropTypes.node,
  shape: PropTypes.oneOf(["round"]),
  size: PropTypes.oneOf(["xs"]),
  variant: PropTypes.oneOf(["fill"]),
  color: PropTypes.oneOf(["blue_A200"]),
};

export { Button };
