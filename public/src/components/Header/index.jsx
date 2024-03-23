import React from "react";
import { Heading, Text } from "./..";

export default function Header({ ...props }) {
  return (
    <header {...props}>
      <Text as="p" className="mb-[52px] text-shadow-ts">
        Z-LANDS
      </Text>
      <div className="flex md:flex-col justify-between items-center w-[58%] mt-[63px] gap-5">
        <a href="#" className="text-shadow-ts">
          <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla !font-extrabold">
            Dashboard{" "}
          </Heading>
        </a>
        <a href="#" className="text-shadow-ts">
          <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla !font-extrabold">
            Validation
          </Heading>
        </a>
        <a href="#" className="w-[30%] md:w-full text-shadow-ts">
          <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla !font-extrabold">
            <>
              Upload <br />
              Documents
            </>
          </Heading>
        </a>
      </div>
    </header>
  );
}
