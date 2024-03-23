import React from "react";
import { useRoutes } from "react-router-dom";
import Home from "pages/Home";
import NotFound from "pages/NotFound";
import DesktopOne from "pages/login";
import DesktopTwo from "pages/Signup";
import DesktopThree from "pages/Dashboard";
import DesktopFour from "pages/DesktopFour";
import DesktopFive from "pages/DesktopFive";
import DesktopSix from "pages/Permission page";

const ProjectRoutes = () => {
  let element = useRoutes([
    { path: "/", element: <Home /> },
    { path: "*", element: <NotFound /> },
    {
      path: "desktopone",
      element: <DesktopOne />,
    },
    {
      path: "desktoptwo",
      element: <DesktopTwo />,
    },
    {
      path: "desktopthree",
      element: <DesktopThree />,
    },
    {
      path: "desktopfour",
      element: <DesktopFour />,
    },
    {
      path: "desktopfive",
      element: <DesktopFive />,
    },
    {
      path: "desktopsix",
      element: <DesktopSix />,
    },
  ]);

  return element;
};

export default ProjectRoutes;
