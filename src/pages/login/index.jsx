import {React,useState} from "react";
import { Helmet } from "react-helmet";
import { Heading, Button, Input, Text } from "../../components";
import "../../styles/tailwind.css";
import "../../styles/index.css";
import "../../styles/font.css";
import {useNavigate} from 'react-router-dom';
import { signInWithEmailAndPassword} from "firebase/auth";
import {auth,db }from '../../firebase'

export default function Loginpage() {

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

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
        const userCredential = await signInWithEmailAndPassword(auth, email, password);
        console.log(userCredential);
        const user = userCredential.user;
        localStorage.setItem('token',user.accessToken);
        localStorage.setItem('user',JSON.stringify(user));
       
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
              onChange={handleEmailChange}
               placeholder="Enter Your ID"
                size="xs"
                shape="round"
                name="edittext"
                className="w-full left-0 bottom-0 right-0 top-0 m-auto sm:pr-5 !shadow-sm absolute placeholder text-white-A700"
              />
            </div>
            <Heading size="5xl" as="h4" className="mt-7 !text-white-A700 !font-semibold">
              Password
            </Heading>
            <div className="self-stretch h-[73px] mt-[9px] relative">
            
              <Input
              onChange ={handlePasswordChange}
              placeholder = "Enter your password"
                size="md"
                shape="round"
                name="password"
                className="w-full left-0 bottom-0 right-0 top-0 m-auto sm:pr-5 absolute placeholder text-white"
              />
            </div>
            <Button  onSubmit = {handleSubmit} shape="round" className="mt-20 sm:px-5">
              Sign in
            </Button>
            <a href="/Signup" className="self-center mt-[37px]">
            <Heading size="2xl" as="h6" className="self-center mt-[37px] !text-white-A700 text-center">
              Don’t have an account? Signup
            </Heading>
            </a>
          </div>
        </div>
      </div>
    </>
  );
}
