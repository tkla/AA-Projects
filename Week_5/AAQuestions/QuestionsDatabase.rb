require 'sqlite3'
require 'singleton'
class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end

class User
    attr_accessor :id, :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    # SELECT * FROM users WHERE id = 1 
    # <= [{id=>1, fname=>'Bob', lname => 'Smith'}, ... ]
    def self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users 
            WHERE
                id = ?
        SQL
        return nil unless users.length > 0
        
        User.new(users.first)
    end

    #Assuming capital first and last name
    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT 
                *
            FROM
                users
            WHERE
                fname = ? 
                AND lname = ? 
        SQL
        return nil unless users.length > 0

        User.new(users.first)
    end
    
    def authored_questions
        Question.find_by_author_id(@id)
    end
end

class Question 
    attr_accessor :id, :title, :body, :user_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def self.find_by_id(id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions 
            WHERE
                id = ?
        SQL
        return nil unless questions.length > 0
        
        Question.new(questions.first)
    end

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions 
            WHERE
                user_id = ?
        SQL
        return nil unless questions.length > 0
        questions.map { |q| Question.new(q) }
        
    end

    def self.find_by_title(title)
        questions = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions 
            WHERE
                title = ?
        SQL
        return nil unless questions.length > 0
        
        Question.new(questions.first)
    end
end

class QuestionFollow 
    attr_accessor :id, :questions_id, :user_id

    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @user_id = options['users_id']
    end

end 

class QuestionLike
    attr_accessor :id, :questions_id, :user_id 
    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @user_id = options['user_id']

    end

    def self.find_by_id(id)
        questions_like = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions_like 
            WHERE
                id = ?
        SQL
        return nil unless questions_like.length > 0
        
        QuestionLike.new(questions_like.first)
    end
end 

class Reply
    attr_accessor :id, :questions_id, :parent_reply_id, :user_id, :body 
    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body']
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies 
            WHERE
                questions_id = ?
        SQL
        return nil unless replies.length > 0
        
        replies.map do |r| 
            Reply.new(r)
        end
    end


    def self.find_by_id(id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies 
            WHERE
                id = ?
        SQL
        return nil unless replies.length > 0
        
        Reply.new(replies.first)
    end

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies 
            WHERE
                user_id = ?
        SQL
        return nil unless replies.length > 0
        
        Reply.new(replies.first)
    end
end