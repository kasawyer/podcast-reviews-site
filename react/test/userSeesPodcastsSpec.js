import PodcastList from '../src/components/PodcastList';

describe('Podcast List', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.callFake(url => {
      if (url.endsWith('/api/v1/podcasts.json')) {
        return createResponseFromFixture('podcasts/podcastsIndex');
      } else if (url.endsWith('/api/v1/podcasts/4/providers.json')) {
        return createResponseFromFixture('providers/providersIndex_1');
      } else if (url.endsWith('/api/v1/podcasts/1/providers.json')) {
        return createResponseFromFixture('providers/providersIndex_1');
      } else if (url.endsWith('/api/v1/podcasts/2/providers.json')) {
        return createResponseFromFixture('providers/providersIndex_2');
      }
    });
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

    it('lists all the podcast names', done => {
      setTimeout(() => {
        let pageText = wrapper.text();

        expect(pageText).toMatch('This American Life');
        expect(pageText).toMatch('Serial');
        expect(pageText).toMatch('Hardcore History');

        done();
      }, 0);
    });

    it('lists the providers under the names of the podcasts', done => {
      setTimeout(() => {
        let pageText = wrapper.text();

        expect(pageText).toMatch('NPR');
        expect(pageText).toMatch('HHC.com');

        done();
      }, 0);
    });
  });
});
