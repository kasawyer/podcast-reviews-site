/*jshint esversion: 6 */

import React from 'react';

const Downvote = props => {
  return(
    <i className="fa fa-arrow-down fa-2x" aria-hidden="true" onClick={() => props.handleDownvote()}></i>
  );
}

export default Downvote;
