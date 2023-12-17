
-- 更新用户存储过程
-- ALTER PROCEDURE login
--     @UserID varchar(50),
--     @Password varchar(50)
-- AS
-- BEGIN
--     -- 检查提供的UserID是否符合格式要求
--     IF PATINDEX('[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]', @UserID) = 1
--     BEGIN
--         -- 检查提供的Password是否符合格式要求
--         IF PATINDEX('[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]', @Password) = 1
--         BEGIN
            
--         END
--         ELSE
--         BEGIN
--             -- 提供的Password不符合格式要求，可选择抛出错误或采取其他处理方式
--             RAISERROR('Password格式不正确，请提供以大写字母开头，后跟6到10位数字的Password。', 16, 1);
--         END
--     END
--     ELSE
--     BEGIN
--         -- 提供的UserID不符合格式要求，可选择抛出错误或采取其他处理方式
--         RAISERROR('UserID格式不正确，请提供以大写字母开头，后跟6到10位数字的UserID。', 16, 1);
--     END
-- END;

select * from account