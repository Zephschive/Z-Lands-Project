import React from "react";
import { Heading, Text } from "./..";
import {auth } from '../../firebase';
import {useNavigate} from 'react-router-dom';
import { signOut } from "firebase/auth";

export default function  Header({ ...props }) {

  const user = JSON.parse(localStorage.getItem('user'));
  const navi = useNavigate();

  const handleout = async () => {
    await signOut(auth);
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    navi("/Login")
  }

  return (
    <header {...props}>
      <Text as="p" className="mb-[20px] text-shadow-ts ">
        Z-LANDS
      </Text>
      <div className="flex md:flex-col justify-around items-center w-[58%] mt-[63px] gap-5">
        <a href="#" className="text-shadow-ts">
          <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla !font-extrabold">
            Dashboard{" "}
          </Heading>
        </a>
        <a href="#" onClick={handleout}  className="text-shadow-ts">
          <Heading size="5xl" as="h1" className="!text-white-A700 !font-karla !font-extrabold">
            Signout{" "}
          </Heading>
        </a>
      </div>
      
        
        
    
    </header>
  );
}
