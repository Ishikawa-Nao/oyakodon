class WorldsController < ApplicationController

    # @homework_world = Hindext.new(deadline:params[:date])
    # @homework_world.save

    before_action :authenticate_user!, only: [:new, :create]

    def index

        if params[:search] == nil
            @worlds= World.all
          elsif params[:search] == ''
            @worlds= World.all
          else
            @worlds = World.where("name LIKE ? ",'%' + params[:search] + '%')
          end
          @rank_worlds = World.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end

    def top
        @rank_worlds = World.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end

    def new
        @world = World.new
    end
    
    def create
        world = World.new(world_params)
        world.user_id = current_user.id
        if world.save
            redirect_to action: "index"
        else
            redirect_to action: "new"
        end
    end

      def show
        @world = World.find(params[:id])
        @comments = @world.comments
        @comment = Comment.new
      end
    

      
      def hokkaidotohoku
        @hokkaidotohokus = World.where(area:"北海道・東北地方")
      end
      
      def kanto
        @kantos = World.where(area:"関東地方")
      end

      def tyubu
        @tyubus = World.where(area:"中部地方")
      end

      def kinki
        @kinkis = World.where(area:"近畿地方")
      end

      def tyugokushikoku
        @tyugokushikokus = World.where(area:"中国・四国地方")
      end

      def kyusyuokinawa
        @kyusyuokinawas = World.where(area:"九州・沖縄地方")
      end

      
    
      def bunka
        @bunkas = World.where(genre:"文化遺産")
      end
      def shizen
        @shizens = World.where(genre:"自然遺産")
      end
      def kiki
        @kikis = World.where(genre:"危機遺産")
      end
      def hu
        @hus = World.where(genre:"負の遺産")
      end
      

      private
      def world_params
        params.require(:world).permit(:name, :genre, :area, :time, :address, :about, :email, :image)
      end

end
