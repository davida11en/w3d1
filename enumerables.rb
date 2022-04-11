class Array

    def my_each(&prc)
        2.times do
            i = 0
            while i < self.length
                prc.call(self[i])
                i += 1
            end
        end
    end

    def my_select(&prc)
        newar = []
        i = 0
        while i < self.length
            if prc.call(self[i])
                newar << self[i]
            end
            i += 1
        end
        newar
    end

    def my_reject(&prc)
        newar = []
        i = 0
        while i < self.length
            if !prc.call(self[i])
                newar << self[i]
            end
            i += 1
        end
        newar
    end

    def my_all?(&prc)
        i = 0
        while i < self.length
            return false if !prc.call(self[i])
            i += 1
        end
        true
    end

    def my_any?(&prc)
        
        i = 0
        while i < self.length
            return true if prc.call(self[i])
            i += 1
        end
        false
    end


    def my_flatten
        new_arr=[]
        return[self] if !self.kind_of?(Array)
        return self if self.none? {|ele| ele.kind_of?(Array)}
        new_arr += self.flatten

    end




end

