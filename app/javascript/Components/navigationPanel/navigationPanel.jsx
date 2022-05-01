import React from 'react';
import NavbarAuth from './NavbarAuth/NavbarAuth';
import NavbarIconContainer from './NavbarIconContainer/NavbarIconContainer';
import NavbarItems from './NavbarItems/NavbarItems';

import classes from './NavigationPanel.module.css';

const NavigationPanel = () => {
  return (
    <nav className={classes.navbarBackground}>
      <NavbarIconContainer />
      <NavbarItems />
      <NavbarAuth />
    </nav>
  )
}

export default NavigationPanel;
