defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna_to_protein([], rna)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """

  @codon_to_protein %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @codon_to_protein |> Map.has_key?(codon) do
      true -> {:ok, @codon_to_protein |> Map.get(codon)}
      _ -> {:error, "invalid codon"}
    end
  end

  defp rna_to_protein(list, rna) do
    <<codon::binary-size(3), remaining_rna::binary>> = rna

    case of_codon(codon) do
      {:error, _} ->
        {:error, "invalid RNA"}

      {:ok, "STOP"} ->
        {:ok, list}

      {:ok, codon} ->
        new_list = list ++ [codon]

        case remaining_rna do
          "" ->
            {:ok, new_list}

          _ ->
            rna_to_protein(new_list, remaining_rna)
        end
    end
  end
end
