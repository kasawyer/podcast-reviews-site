/*jshint esversion: 6 */

import React from 'react';

const Upvote = props => {
  return(
    <i className="fa fa-arrow-up" aria-hidden="true" onClick={() => props.handleUpvote()}></i>
  );
}

export default Upvote;
