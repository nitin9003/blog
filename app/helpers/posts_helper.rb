module PostsHelper
 
 
  def label_for_position
    content_tag(:th, content_tag(:span, "Post Position", :class => 'label') )
  end

  def post_position(post)
    post = Post.count(:conditions => ['id <= ?', post.id])
    content_tag :td, post
  end 
   
  def label_for_title
    content_tag(:th, content_tag(:span, "Post Title", :class => 'label') )
  end
  
  def post_title_header(post)
    content_tag :h2, post.title
  end

  def post_title_body(post)
    content_tag :td, post.title
  end

  def label_for_tagline
    content_tag(:th, content_tag(:span, "Post Tagline", :class => 'label') )
  end
  
  def post_tagline(post) 
    content_tag :td, post.tagline
  end

  def label_for_visible
    content_tag(:th, content_tag(:span, "Post Visibility", :class => 'label') )
  end
  
  def post_visible(post)
    content_tag :td, post.visible
  end

  def label_for_content
    content_tag(:th, content_tag(:span, "Post Content", :class => 'label') )
  end

  def post_content(post)
    content_tag :td, post.content.html_safe 
  end


end
