import React from "react";
import PropTypes from "prop-types";

const shapes = {
  round: "rounded",
};
const variants = {
  fill: {
    blue_gray_100_8c: "bg-blue_gray-100_8c shadow-xs text-white-A700_7a",
    blue_gray_100: "bg-blue_gray-100",
  },
};
const sizes = {
  md: "h-[73px] pl-[9px] pr-[35px]",
  sm: "h-[73px] pl-[13px] pr-[35px] text-4xl",
  xs: "h-[69px] pl-[9px] pr-[35px]",
  lg: "h-[108px] pl-[9px] pr-[35px]",
};

const Input = React.forwardRef(
  (
    {
      className = "",
      name = "",
      placeholder = "",
      type = "text",
      children,
      label = "",
      prefix,
      suffix,
      onChange,
      shape = "",
      variant = "fill",
      size = "lg",
      color = "blue_gray_100_8c",
      ...restProps
    },
    ref,
  ) => {
    const handleChange = (e) => {
      if (onChange) onChange(e?.target?.value);
    };

    return (
      <>
        <div
          className={`${className} flex items-center justify-center ${shapes[shape] || ""} ${variants[variant]?.[color] || variants[variant] || ""} ${sizes[size] || ""}`}
        >
          {!!label && label}
          {!!prefix && prefix}
          <input ref={ref} type={type} name={name} onChange={handleChange} placeholder={placeholder} {...restProps} />
          {!!suffix && suffix}
        </div>
      </>
    );
  },
);

Input.propTypes = {
  className: PropTypes.string,
  name: PropTypes.string,
  placeholder: PropTypes.string,
  type: PropTypes.string,
  label: PropTypes.string,
  prefix: PropTypes.node,
  suffix: PropTypes.node,
  
  shape: PropTypes.oneOf(["round"]),
  size: PropTypes.oneOf(["md", "sm", "xs", "lg"]),
  variant: PropTypes.oneOf(["fill"]),
  color: PropTypes.oneOf(["blue_gray_100_8c", "blue_gray_100"]),
};

export { Input };
