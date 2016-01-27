class Complement

  VERSION = 3

  DNA_TO_RNA = {'G' => 'C',
                'C' => 'G',
                'T' => 'A',
                'A' => 'U'}

  def self.of_dna dna_string
    rna_string = ""
    dna_string.split("").each do |dna_nucleotide|
      raise ArgumentError unless "GCTA".include? dna_nucleotide
      rna_string.concat DNA_TO_RNA[dna_nucleotide]
    end
    rna_string
  end

end