defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @earth_year_in_seconds 31_557_600

  @orbital_period_relative_to_earth_years %{
    :mercury => 0.2408467,
    :venus => 0.61519726,
    :earth => 1,
    :mars => 1.8808158,
    :jupiter => 11.862615,
    :saturn => 29.447498,
    :uranus => 84.016846,
    :neptune => 164.79132
  }

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_age(seconds) / @orbital_period_relative_to_earth_years[planet]
  end

  defp earth_age(seconds) do
    seconds / @earth_year_in_seconds
  end
end