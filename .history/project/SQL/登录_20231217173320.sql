
-- ��¼�洢����
-- CREATE PROCEDURE login
--     @UserID varchar(50),
--     @Password varchar(50)
-- AS
-- BEGIN
--     -- ����ṩ��UserID�Ƿ���ϸ�ʽҪ��
--     IF PATINDEX('[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]', @UserID) = 1
--     BEGIN
--         -- ����ṩ��Password�Ƿ���ϸ�ʽҪ��
--         IF PATINDEX('[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]', @Password) = 1
--         BEGIN
--             IF EXISTS(select * from Users where UserID=@UserID and [Password]=@Password)
--                 RETURN 1
--             ELSE 
--                 RETURN 0
--         END
--         ELSE
--         BEGIN
--             -- �ṩ��Password�����ϸ�ʽҪ�󣬿�ѡ���׳�������ȡ��������ʽ
--             RAISERROR('Password��ʽ����ȷ�����ṩ�Դ�д��ĸ��ͷ�����6��10λ���ֵ�Password��', 16, 1);
--         END
--     END
--     ELSE
--     BEGIN
--         -- �ṩ��UserID�����ϸ�ʽҪ�󣬿�ѡ���׳�������ȡ��������ʽ
--         RAISERROR('UserID��ʽ����ȷ�����ṩ�Դ�д��ĸ��ͷ�����6��10λ���ֵ�UserID��', 16, 1);
--     END
-- END;


BEGIN TRY
    DECLARE @LoginRes INT
    EXEC @LoginRes = login @UserID='A22222222', @Password='A222222222'
    PRINT '��¼���: ' + CAST(@LoginRes AS VARCHAR)
END TRY
BEGIN CATCH
    PRINT '������: ' + ERROR_MESSAGE()
END CATCH