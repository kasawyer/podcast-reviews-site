import PodcastList from '../src/components/PodcastList';

describe('Podcast List', () => {
  var wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('podcasts/podcastsIndex')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the Podcastaway homepage', () => {
    beforeEach(() => {
      wrapper = mount(
        <PodcastList />
      );
    });

    it('lists al the podcasts', done => {
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch('This American Life');
        expect(pageText).toMatch('Serial');
        expect(pageText).toMatch('Hardcore History');

        done();
      }, 0);
    });
  });
});
