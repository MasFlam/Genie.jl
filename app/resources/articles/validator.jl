module ArticlesValidator
using App, Model, App.Articles

function not_empty_if_published{T<:AbstractModel}(_::Symbol, m::T, args::Vararg{Any})
  Articles.is_published(m) && isempty(m.content) && Validation.push_error!(m, :content, :not_empty_if_published, "Content can't be empty if the article is published") && return false
  true
end

function not_empty_if_long_content{T<:AbstractModel}(_::Symbol, m::T, args::Vararg{Any})
  length(m.content) > args[1] && isempty(m.summary) && Validation.push_error!(m, :summary, :not_empty_if_long_content, "Summary can't be empty if the article's content is longer than $(args[1])") && return false
  true
end

end