class VentureCapitalist
    attr_reader :name,:total_worth
    @@all=[]
    
    def initialize(name, total_worth)
        @name=name
        @total_worth=total_worth
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select do |capitalist|
            capitalist.total_worth >100
        end
    end

    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding|
            funding.venture_capitalist ==self
        end
    end

    def portfolio
        self.funding_rounds.collect {|funding| funding.startup}.uniq
    end

    def biggest_investment
        biggest_investment=self.funding_rounds.first.investment
        biggest=self.funding_rounds.first
        self.funding_rounds.each do |funding|
            if funding.investment >biggest_investment
                biggest_investment=funding.investment
                biggest =funding
            end
        end
        biggest
    end

    def invested(domain)
        sum=0
        FundingRound.all.each  do |funding|
            if funding.startup.domain==domain && funding.venture_capitalist==self
                sum += funding.investment
            end
        end
        sum
    end
end
