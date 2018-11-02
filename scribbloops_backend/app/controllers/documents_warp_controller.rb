class DocumentsWarpController < ApplicationWarpController

  def index(params)
        Document.after_create do
            yield Document.where(portfolio_id: params[:portfolio_id])
        end
        Document.after_update do
            yield Document.where(portfolio_id: params[:portfolio_id])
        end
        Document.after_destroy do
            yield Document.where(portfolio_id: params[:portfolio_id])
        end
        yield Document.where(portfolio_id: params[:portfolio_id])
    end

    def show(params)
        Document.after_update do | document |
            if(params[:id].to_i == document.id)
                yield Document.find(params[:id])
            end
        end
    end

    def create(params)
        yield Document.create(document_params)
    end

    def destroy(params)
        yield Document.destroy(params[:id])
    end

    def update(params)
        document = Document.find(params[:id])

        yield document.update(document_params)
    end

    private

    def document_params
        params.permit(:title, :content, :portfolio_id)
    end


end