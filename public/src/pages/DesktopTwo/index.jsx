import React from "react";
import { Helmet } from "react-helmet";
import { Heading, Input, Text } from "../../components";

export default function DesktopTwoPage() {
  return (
    <>
      <Helmet>
        <title>ZLANDS</title>
        <meta name="description" content="Web site created using create-react-app" />
      </Helmet>
      <div className="flex justify-end w-full p-2.5 bg-gray-900">
        <div className="flex flex-col items-start w-[68%] mb-[22px] mr-[269px]">
          <Text as="p" className="ml-40 text-shadow-ts">
            Z-LANDS
          </Text>
          <Text size="xs" as="p" className="mt-[61px] text-center text-shadow-ts">
            Create an Admin Account
          </Text>
          <Heading size="5xl" as="h1" className="mt-[55px] ml-[207px] !text-white-A700 !font-karla text-shadow-ts">
            Welcome Admin
          </Heading>
          <div className="flex flex-col w-full mt-3 mx-auto md:p-5 max-w-[633px]">
            <Heading size="5xl" as="h2" className="!text-white-A700 !font-semibold">
              Admin ID
            </Heading>
            <div className="h-[69px] mt-[15px] relative">
              <Heading
                size="5xl"
                as="h3"
                className="bottom-[8%] left-[2%] m-auto !text-white-A700_7a !font-semibold absolute"
              >
                Enter your username
              </Heading>
              <Input
                size="xs"
                shape="round"
                name="edittext"
                className="w-full left-0 bottom-0 right-0 top-0 m-auto sm:pr-5 !shadow-sm absolute"
              />
            </div>
            <Heading size="5xl" as="h4" className="mt-[30px] !text-white-A700 !font-semibold">
              Password
            </Heading>
            <Input
              size="sm"
              shape="round"
              type="password"
              name="password"
              placeholder="Enter your password"
              className="mt-[9px] sm:pr-5 font-semibold"
            />
            <Heading size="5xl" as="h5" className="mt-[37px] !text-white-A700 !font-semibold">
              Confirm Password{" "}
            </Heading>
            <Input
              size="sm"
              shape="round"
              type="password"
              name="confirmpassword"
              placeholder="Confirm password"
              className="mt-[9px] sm:pr-5 font-semibold"
            />
            <div className="flex justify-center w-[77%] md:w-full mt-[75px] ml-[119px]">
              <Heading
                size="5xl"
                as="h6"
                className="flex justify-center items-center h-[59px] px-[35px] py-1 sm:px-5 !text-white-A700 !font-semibold bg-blue-A200 text-shadow-ts1 rounded-[25px]"
              >
                Sign up
              </Heading>
            </div>
            <Heading size="2xl" as="h4" className="self-center mt-[9px] !text-white-A700 text-center">
              Already have an account? Log in{" "}
            </Heading>
          </div>
        </div>
      </div>
    </>
  );
}
