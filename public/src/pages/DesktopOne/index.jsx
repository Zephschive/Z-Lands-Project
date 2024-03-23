import React from "react";
import { Helmet } from "react-helmet";
import { Heading, Button, Input, Text } from "../../components";

export default function DesktopOnePage() {
  return (
    <>
      <Helmet>
        <title>ZLANDS</title>
        <meta name="description" content="Web site created using create-react-app" />
      </Helmet>
      <div className="flex justify-end w-full p-2.5 bg-gray-900">
        <div className="flex flex-col items-center w-[61%] mb-[162px] mr-[379px] gap-3">
          <div className="flex flex-col items-center gap-[58px]">
            <Text as="p" className="text-shadow-ts">
              Z-LANDS
            </Text>
            <a href="#" className="text-shadow-ts">
              <Text size="xs" as="p" className="text-center">
                Log in
              </Text>
            </a>
            <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla text-shadow-ts">
              Welcome Admin
            </Heading>
          </div>
          <div className="flex flex-col self-stretch items-start">
            <Heading size="5xl" as="h2" className="!text-white-A700 !font-semibold">
              Admin ID
            </Heading>
            <div className="self-stretch h-[69px] mt-[15px] relative">
            
              <Input
              placeholder="Enter your ID"
                size="xs"
                shape="round"
                name="edittext"
                className="w-full left-0 bottom-0 right-0 top-0 m-auto sm:pr-5 !shadow-sm absolute"
              />
            </div>
            <Heading size="5xl" as="h4" className="mt-7 !text-white-A700 !font-semibold">
              Password
            </Heading>
            <div className="self-stretch h-[73px] mt-[9px] relative">
             
              <Input
                placeholder=""
                size="md"
                shape="round"
                name="password"
                className="w-full left-0 bottom-0 right-0 top-0 m-auto sm:pr-5 absolute"
              />
            </div>
            <Button shape="round" className="mt-20 sm:px-5">
              Sign in
            </Button>
            <Heading size="2xl" as="h6" className="self-center mt-[37px] !text-white-A700 text-center">
              Don’t have an account? Signup
            </Heading>
          </div>
        </div>
      </div>
    </>
  );
}
