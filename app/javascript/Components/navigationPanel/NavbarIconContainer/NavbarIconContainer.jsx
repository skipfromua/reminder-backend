import React from 'react';
import ReminderLogo from "../../../assets/icons/1.png";

import classes from './NavbarIconContainer.module.css'

const NavbarIconContainer = () => {
  return (
    <div className={classes.navbarIconContainer}>
      <img className={classes.navbarIcon} src={ReminderLogo} alt=""></img>
    </div>
  )
}

export default NavbarIconContainer;
