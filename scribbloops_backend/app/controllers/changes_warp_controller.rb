class ChangesWarpController < ApplicationWarpController

  def index(params)
    Change.after_commit do | change |
      if(change.document_id == params[:document_id])
        yield Change.where(document_id: params[:document_id]).order('updated_at desc').limit(10).reverse()
      end
    end
    # event listener; after_commit is an ActiveRecord method, and each change made is yielded by the Warp Controller.
    yield Change.where(document_id: params[:document_id]).order('updated_at desc').limit(10).reverse()
  end

  def show
    # portfolio = Portfolio.find(params[:id])

    # yield portfolio, include: [:documents]
  end

  def create(params)
    change = Change.create(change_params)

    yield change
  end

  private

  def change_params
    params.permit(:ops, :document_id, :updated_at)
    # params.require(:change).permit(:ops, :document_id, :updated_at)
  end

#   def index(params)
#     Change.after_commit do | change |
#       if(change.document_id == params[:document_id])
#         yield Change.where(document_id: params[:document_id]).order('updated_at desc').limit(10).reverse()
#       end
#     end
#     # event listener; after_commit is an ActiveRecord method, and each change made is yielded by the Warp Controller.
#     yield Change.where(document_id: params[:document_id]).order('updated_at desc').limit(10).reverse()
#   end

#   def show
#     # portfolio = Portfolio.find(params[:id])

#     # yield portfolio, include: [:documents]
#   end

#   def create(params)
#     change = Change.create(change_params)

#     yield change
#   end

#   private

#   def change_params
#     params.permit(:ops, :document_id, :updated_at)
#     # params.require(:change).permit(:ops, :document_id, :updated_at)
#   end

end