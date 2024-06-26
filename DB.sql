DROP DATABASE IF EXISTS `exam_ygy_24_05`;
CREATE DATABASE `exam_ygy_24_05`;
USE `exam_ygy_24_05`;

CREATE TABLE FAQ (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`regDate`	DATETIME NOT NULL COMMENT '작성날짜',
	`updateDate`	DATETIME NOT NULL COMMENT '수정날짜',
	`question`	CHAR(100)	NULL	COMMENT '질문',
	`answer`	TEXT	NOT NULL	COMMENT '답변'
);

INSERT INTO FAQ (regDate, updateDate, question, answer) VALUES 
(NOW(), NOW(), '이 프로젝트의 목적은 무엇인가요?', '프로젝트의 목표는 프로젝트의 주요 목표를 설명하는 것입니다 (예: "사용자가 기술 혁신을 공유하고 논의할 수 있는 플랫폼 제공").'),
(NOW(), NOW(), '계정을 등록하려면 어떻게 해야 하나요?', '홈페이지에서 \'가입\' 버튼을 클릭한 후, 필요한 정보를 입력하고 지시에 따라 등록을 완료하세요.'),
(NOW(), NOW(), '비밀번호를 잊어버리면 어떻게 해야 하나요?', '로그인 페이지로 이동하여 "비밀번호 찾기"를 클릭하고 이메일을 통해 비밀번호를 재설정하는 지침을 따르세요.'),
(NOW(), NOW(), '내 프로필 정보를 어떻게 업데이트할 수 있나요?', '계정에 로그인한 후, "프로필" 섹션으로 이동하여 "프로필 수정"을 클릭하여 정보를 업데이트하세요.'),
(NOW(), NOW(), '새 글을 작성하려면 어떻게 해야 하나요?', '해당 섹션이나 카테고리로 이동하여 ‘새 글 작성’ 버튼을 클릭하세요. 세부 정보를 입력하고 제출하세요.'),
(NOW(), NOW(), '고객 지원팀에 어떻게 연락할 수 있나요?', '페이지 하단의 "문의하기" 링크를 클릭하고 양식을 작성하여 고객 지원팀에 연락할 수 있습니다.'),
(NOW(), NOW(), '따라야 할 커뮤니티 가이드라인이 있나요?', '네. 예상되는 행동 및 규칙에 대한 자세한 내용은 커뮤니티 가이드라인 페이지를 참조하세요.'),
(NOW(), NOW(), '계정을 삭제할 수 있나요?', '네, "계정 설정" 섹션으로 이동하여 "계정 삭제"를 선택하면 계정을 삭제할 수 있습니다. 이 작업은 되돌릴 수 없습니다.'),
(NOW(), NOW(), '내 개인 정보는 안전한가요?', '네, 귀하의 개인정보 보호는 최우선이며 데이터를 보호하기 위한 강력한 보안 조치를 마련하고 있습니다. 자세한 내용은 개인정보 보호정책을 참조하세요.'),
(NOW(), NOW(), '기술적 문제가 발생하면 어떻게 해야 하나요?', '기술적 문제가 발생하면 "문의하기" 양식을 사용하거나 지원팀 이메일 [Support Email]로 이메일을 보내 알려주세요.');