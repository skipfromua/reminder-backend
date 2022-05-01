import React from 'react';
import classes from './PrimaryButton.module.css'

const PrimaryButton = ({children}) => {
  return (
    <button className={classes.primaryButton}>{children}</button>
  )
}

export default PrimaryButton;
