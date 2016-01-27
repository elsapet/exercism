class Hamming

  VERSION = 1

  def self.compute(dna_1, dna_2)

    raise ArgumentError unless dna_1.length == dna_2.length

    hamming_count = 0
    dna_1.split("").each_with_index do |nucleotide, i|
      hamming_count += 1 unless nucleotide == dna_2[i]
    end
    hamming_count
  end


end