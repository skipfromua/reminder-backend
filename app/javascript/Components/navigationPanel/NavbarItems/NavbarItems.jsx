import React from 'react';
import classes from './NavbarItems.module.css'

const NavbarItems = () => {
  return (
    <ul className={classes.navbarList}>
      <li className={classes.active}><a href="">First</a></li>
      <li><a href="">Second</a></li>
      <li><a href="">Third</a></li>
    </ul>
  );
}

export default NavbarItems;