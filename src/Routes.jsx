import React from "react";
import { useRoutes } from "react-router-dom";

import NotFound from "./pages/NotFound";
import Loginpage from "./pages/login";
import Signuppage from "./pages/Signup";


import DesktopSix from "./pages/Permission page";
import Dashboardpage from "./pages/Dashboard";

const ProjectRoutes = () => {
  let element = useRoutes([ 
    
    { path: "*", element: <NotFound /> },
    {
      path: "/",
      element: <Loginpage />,
    },
    {
      path: "Signup",
      element: <Signuppage/>,
    },
    {
      path: "Dashboard",
      element: <Dashboardpage />,
    },
  
    {
      path: "desktopsix",
      element: <DesktopSix />,
    },
  ]);

  return element;
};

export default ProjectRoutes;
