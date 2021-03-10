import distance from '@turf/distance';

const computeDistance = (place, shop) => {
  const from = turf.point(place);
  const to = turf.point(shop);
  const options = { units: 'km' };
  const km = turf.distance(from, to, options);
};

export { computeDistance };
