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
end

