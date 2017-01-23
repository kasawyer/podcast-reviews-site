import React, { Component } from 'react';
import ReviewList from './ReviewList';

class App extends Component {
  constructor() {
    super();
    this.state = {

    }
  }

  render() {
    return (
      <ReviewList
      podcastId={document.getElementById('podcast-id').value}
      />
    );
  }
}

export default App;
