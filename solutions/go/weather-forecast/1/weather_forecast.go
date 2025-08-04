// Package weather provides forecast for the current weather condition of various cities in Goblinocus.
package weather

// CurrentCondition represents the current condition.
var CurrentCondition string
// CurrentLocation represents the current location.
var CurrentLocation string

// Forecast returns the forecast.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
