import React, { useState } from "react";
import { Helmet } from "react-helmet";
import { Heading, Input, Text } from "../../components";
import {useNavigate} from 'react-router-dom';
import {  createUserWithEmailAndPassword} from "firebase/auth";
import {auth,db }from '../../firebase'
import {addDoc,collection} from "firebase/firestore";






export default function Signuppage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");

  const nav =useNavigate();

  const handleEmailChange = (value) => {
    setEmail(value);
  };

  const handlePasswordChange = (value) => {
    setPassword(value);
  };

  const handleConfirmPasswordChange = (value) => {
    setConfirmPassword(value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
        const userCredential = await createUserWithEmailAndPassword(auth, email, password);
        console.log(userCredential);
        const user = userCredential.user;
        localStorage.setItem('token',user.accessToken);
        localStorage.setItem('user',JSON.stringify(user));
        await addDoc(collection(db,'Admin'),{
          AdminEmail:email,
          AdminPassword:password
        })
        nav("/Dashboard");
    } catch (error) {
        console.log(error);
    }
  };

  return (
    <>
      <Helmet>
        <title>ZLANDS</title>
        <meta name="description" content="Web site created using create-react-app" />
      </Helmet>
      <div className="flex justify-end w-full p-2.5 bg-gray-900">
        <div className="flex flex-col items-start w-[68%] mb-[22px] mr-[169px]">
          <Text as="p" className="ml-40 text-shadow-ts">
            Z-LANDS
          </Text>
          <Text size="xs" as="p" className="mt-[62px] text-center text-shadow-ts">
            Create an Admin Account
          </Text>
          <Heading size="5xl" as="h1" className="mt-[55px] ml-[207px] !text-white-A700 !font-karla text-shadow-ts">
            Welcome Admin
          </Heading>
          <div className="flex flex-col w-full mt-3 mx-auto md:p-5 ml-[55px] max-w-[833px]">
            <Heading size="5xl" as="h2" className="!text-white-A700 !font-semibold">
              Admin Email
            </Heading>
            <form onSubmit={handleSubmit} className="">
              <div className="h-[69px] mt-[15px] relative">
                <Input
                  onChange={handleEmailChange}
                  placeholder="Enter your email"
                  size="sm"
                  shape="round"
                  name="email"
                  className="w-full left-0 bottom-0 right-0 top-0 m-auto sm:pr-5 !shadow-sm absolute font-semibold text-white-A700"
                />
              </div>
              <Heading size="5xl" as="h4" className="mt-[30px] !text-white-A700 !font-semibold">
                Password
              </Heading>
              <Input
                onChange={handlePasswordChange}
                size="sm"
                shape="round"
                type="password"
                name="password"
                placeholder="Enter your password"
                className="mt-[9px] sm:pr-5 font-semibold text-white-A700"
              />
              <Heading size="5xl" as="h5" className="mt-[37px] !text-white-A700 !font-semibold">
                Confirm Password{" "}
              </Heading>
              <Input
                onChange={handleConfirmPasswordChange}
                size="sm"
                shape="round"
                type="password"
                name="confirmPassword"
                placeholder="Confirm password"
                className="mt-[9px] sm:pr-5 font-semibold text-white-A700"
              />
              <div className="flex justify-center w-[77%] md:w-full mt-[75px] ml-[119px]">
                <button
                onSubmit={handleSubmit}
                  type="submit"
                  size="xs"
                  as="h6"
                  className="flex justify-center items-center h-[59px] px-[35px] py-1 sm:px-5 !text-white-A700 !font-semibold bg-blue-A200 text-shadow-ts1 rounded-[25px] "
                >
                  Sign up
                </button>
              </div>
            </form>
            <Heading size="2xl" as="h4" className="self-center mt-[9px] !text-white-A700 text-center">
              Already have an account? Log in{" "}
            </Heading>
          </div>
        </div>
      </div>
    </>
  );
}
