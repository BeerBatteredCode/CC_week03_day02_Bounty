DROP TABLE IF EXISTS space_cowboys_bounties;

CREATE TABLE space_cowboys_bounties(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT4,
  homeworld VARCHAR(255)
);
