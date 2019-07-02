class Startup
    attr_reader :founder
    attr_accessor :name,:domain
    @@all=[]

    def initialize(name,founder,domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all<<self
    end

    def pivot(domain,name)
        @name=name
        @domain=domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find do |startup|
            startup.founder==founder
        end
    end

    def self.domains
        array=@@all.collect do |startup|
            startup.domain
        end
        array.uniq
    end

    def sign_contract(capitalist,type,investment)
        FundingRound.new(self,capitalist,type,investment)
    end

    def num_funding_rounds
        array=FundingRound.all.select do |funding|
            funding.startup==self
        end
        array.size
    end

    def total_funds
        sum=0
        array= FundingRound.all.select do |funding|
            funding.startup==self
        end
        array.each do |funding|
            sum += funding.investment
        end
        sum
    end

    def investors
        array= FundingRound.all.select do |funding|
            funding.startup==self
        end
        new_array=array.collect do |funding|
            funding.venture_capitalist
        end
        new_array.uniq
    end

    def big_investors
        self.investors & VentureCapitalist.tres_commas_club
    end

end
