defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  def to_rna(dna) do
    Enum.map(dna, fn dna_nucleotide -> to_rna_nucleotide(dna_nucleotide) end)
  end

  def to_rna_nucleotide(dna_nucleotide) do
    cond do
      dna_nucleotide in [?G, ?g] ->
        ?C

      dna_nucleotide in [?C, ?c] ->
        ?G

      dna_nucleotide in [?T, ?t] ->
        ?A

      dna_nucleotide in [?A, ?a] ->
        ?U

      true ->
        nil
    end
  end
end
