import React from 'react';
import PrimaryButton from '../../UI/buttons/PrimaryButton';

import classes from './NavbarAuth.module.css'

const NavbarAuth = () => {
  return (
    <div className={classes.navbarAuth}>
      <div className={classes.navbarWelcome}>
        <label for="">Hello Oleksandr</label>
      </div>
      <div>
        <PrimaryButton>Sign in</PrimaryButton>
      </div>
      <PrimaryButton>Sign up</PrimaryButton>
    </div>
  )
}

export default NavbarAuth;
