years(AgeSec, Years):-
    Years is AgeSec / 31557600.

space_age(Planet, AgeSec, Years):-
    Planet = "Earth",
    years(AgeSec, Years).

space_age(Planet, AgeSec, Years):-
    Planet = "Mercury",
    years(AgeSec, EarthYears),
    Years is EarthYears / 0.2408467.

space_age(Planet, AgeSec, Years):-
    Planet = "Venus",
    years(AgeSec, EarthYears),
    Years is EarthYears / 0.61519726.

space_age(Planet, AgeSec, Years):-
    Planet = "Mars",
    years(AgeSec, EarthYears),
    Years is EarthYears / 1.8808158.

space_age(Planet, AgeSec, Years):-
    Planet = "Jupiter",
    years(AgeSec, EarthYears),
    Years is EarthYears / 11.862615.

space_age(Planet, AgeSec, Years):-
    Planet = "Saturn",
    years(AgeSec, EarthYears),
    Years is EarthYears / 29.447498.

space_age(Planet, AgeSec, Years):-
    Planet = "Uranus",
    years(AgeSec, EarthYears),
    Years is EarthYears / 84.016846.

space_age(Planet, AgeSec, Years):-
    Planet = "Neptune",
    years(AgeSec, EarthYears),
    Years is EarthYears / 164.79132.