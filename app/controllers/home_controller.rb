class HomeController < ApplicationController

  def index
  end

  def calendar
  end

  def signup
  end

  def signin
  end

  def staff_list
  end

  def about
  end

  before_action :set_appointment, only: [:new]
  def new
    @account = Account.new
    @user = User.new
    @student = Student.new
    @booking = Booking.new
    @schedules = Schedule.where('start >= ? and start <=  ?', Date.today + 1.day, Date.today + 2.weeks).where(title: 'Available').order('start ASC').all
  end

  def create

    create_student_account
    @user = User.new(user_params)
    @user.account_id = @account.id
    respond_to do |format|
      if @user.save
        create_client_profile
        create_client_booking
        auto_login(@user)
        UserMailer.new_signup_booking_admin(@user, @booking).deliver_later
        UserMailer.new_signup_booking_client(@user, @booking).deliver_later
        format.html { redirect_to dashboard_url, notice: 'Your account was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_back fallback_location: root_path, alert: 'An error occurred while sending this request.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private
    def set_appointment
      @appointment = Appointment.find(params[:lesson_id])
    end
def user_params
     params.require(:user).permit(:email, :password, :time_zone)
    end

    def create_student_account
      @account = Account.new()
      @account.status = 'active'
      @account.account = 'prefix-' + SecureRandom.hex(4)
      @account.account_type = 'client'
      @account.save
    end

def create_student_profile
      @student = Student.new()
      @student.firstname = params[:user][:client][:firstname]
      @student.lastname = params[:user][:client][:lastname]
      @student.phone = params[:user][:client][:phone]
      @student.user_id = @user.id
      @student.account_id = @user.account_id
      @student.save
    end

    def create_student_booking
      @appointment = Appointment.find(params[:user][:booking][:lesson_id])
      @booking = Booking.new()
      @booking.lesson_id = params[:user][:booking][:lesson_id]
      @booking.schedule_id = params[:user][:booking][:schedule_id]
      @booking.student_id = @student.id
      @booking.account_id = @user.account_id
      @booking.title = @appointment.title
      @booking.cost = @appointment.cost
      @booking.status = 'Booked'
      @booking.save
      @schedule = Schedule.find(params[:user][:booking][:schedule_id])
      @booking.trainer_id = @schedule.trainer_id
      @booking.start = @schedule.start
      @booking.refunded = 0
      @booking.save
      @schedule.title = 'Booked'
      @schedule.save
    end

    def index
      @schedules = Schedule.all
    end

    # GET /schedules/1
    # GET /schedules/1.json
    def show
    end

    # GET /schedules/new
    def new
      @schedule = Schedule.new
    end

    # GET /schedules/1/edit
    def edit
    end

    # POST /schedules
    # POST /schedules.json
    def create
      @schedule = Schedule.new(schedule_params)

      respond_to do |format|
        if @schedule.save
          format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /schedules/1
    # PATCH/PUT /schedules/1.json
    def update
      respond_to do |format|
        if @schedule.update(schedule_params)
          format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
          format.json { render :show, status: :ok, location: @schedule }
        else
          format.html { render :edit }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /schedules/1
    # DELETE /schedules/1.json
    def destroy
      @schedule.destroy
      respond_to do |format|
        format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_schedule
        @schedule = Schedule.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def schedule_params
        params.require(:schedule).permit(:title, :start, :end, :trainer_id, :account_id)
      end


end
