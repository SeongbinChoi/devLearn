<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
.lecture_content {
    overflow: hidden;
    background-color: #212529;
}

.lecture_header {
    line-height: 1.5;
    letter-spacing: -.3px;
    font-size: 16px;
    display: flex;
    align-items: center;
    margin-bottom: 12px;
    padding: 20px 32px 0;	
    color: #ffffff;
    font-weight: 700;
}

.lecture_body {
	padding: 0 32px 32px;
	
	
}

.lecture_video_content {
	margin-bottom: 40px;
    width: 100%;
}

.lecture_video {
	padding: 0px;
    word-spacing: normal;
    position: relative;
    box-sizing: content-box !important;
    text-align: left;
    user-select: none;
    font-family: sans-serif;
    min-height: 15px;
    font-size: 14px;
    line-height: 1em;
    direction: ltr;
    
    width: 720px;
    height: 360px;
    margin-bottom: 50px;
    background: #EAEAEA;
}

.lecture_info {
	display: flex;
    align-items: center;
}

.lecture_title {
	font-weight: 400;
    line-height: 1.5;
    letter-spacing: -.3px;
    font-size: 16px;
    color: #212529;
}

.list_title {
	line-height: 1.5;
    letter-spacing: -.3px;
    font-size: 16px;
    display: flex;
    align-items: center;
    padding-bottom: 16px;
    border-bottom: 1px solid #495057;
    color: #fff;
    font-weight: 700;
}

.cart_button_cover {
	margin-left: auto;
}

.list {
display: flex;
    align-items: center;
    padding: 12px;
    border-bottom: 1px solid #343a40;
    cursor: pointer;
}

.list_thumbnail {
	flex-shrink: 0;
    position: relative;
    overflow: hidden;
    margin-right: 12px;
    width: 95px;
    height: 64px;
    border-radius: 4px;
}

.thumbnail_label_cover {
	position: absolute;
    top: 0;
    left: 0;
    right: 0;
    display: none;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,.48);
}

.thumbnail_cover {
	display: inline-flex;
    align-items: center;
    justify-content: center;
    line-height: 1.5;
    letter-spacing: -.3px;
    font-size: 12px;
    padding: 0 6px;
    height: 22px;
    border-radius: 2px;
    background-color: #e5503c;
    color: #fff;
    font-weight: 700;
}

.list_content_title {
    font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: 14px;
    margin-right: 36px;
    color: #fff;
}

.list_content_runtime {
	font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: 14px;
    margin-left: auto;
    color: #fff;
}
</style>
</head>
<body>
<main>
<div class="lecture_content">
	<div class="lecture">
		<div class="lecture_header">
			"강의 영상"
		</div>
		<div class="lecture_body">
			<div class="lecture_video_content">
				<div class="lecture_video">
				
				</div>
				<div class="lecture_info">
					<div class="lecture_title">소개 영상</div>
				</div>
			</div>
			<div class="lecture_list">
				<div class="list_title">
				강의 순서
					<div class="cart_button_cover">
						<button type="button" class="btn btn-outline-dark">수강바구니에 담기</button>
					</div>	
				</div>
				<div class="list_content">
					<div class="list">
						<div class="list_thumbnail">
							<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAAEjCAMAAAB3vHFtAAAAilBMVEX///8AAAD3+Pjs7OzZ2dn7+/v19fXx8fHk5OTr6+tMTExISEi/v7/W1taYmJj5+fmHh4dnZ2fg4OA5OTnIyMijo6OQkJC6urqxsbF1dXWZmZlcXFyrq6tqamrLy8tDQ0MwMDBUVFQQEBAlJSUZGRl4eHg1NTWJiYmAgIA+Pj4eHh5gYGAUFBQjIyM0J+lJAAAMwUlEQVR4nO2diZqivBKGSbMriCIIKLKIG23P/d/eIWwmEgRnWNL/yfvM045rfx2TSlWlEriv3wTHYDAYDAaD8X+FJMsyvOXnFlKh3UpceG9/W+fcLXhPis9/gMFxCvxBBfdkl4td52qTeL+C7ILsjsErGbyRqZVmVllx99B7iY3c0cJ4uYxDlya1R/Re4lk5mp7dkRT5GqmKRJPaRVAIhPo471Cyzp/kAdA4jiK19mKZE17ExnNS6NlAp0ktyg0gWKIDYo5zwdGgRa2VLmpC90vhZZk/3DIzqyqGkfqwuRWfmrZVtQxrEVvwVsn6xW63SxbZj6B6hbJTqVFbcLxU/8uU3nbZP7CqHvGBM4+oVja1za3s7XVfPsBHaUTNvFuAqD06EA0Uag0bHMU78GnqCIja2t7m87B9CuGtGwJ3Nm1NBJP8uGQZ5S1VjctgMMbFuT3SdHv8FeNefsS+rpimgj3qbNWZ9LzH80iPmgmdciOF+LC0BOQnZkWJW/qrukjlaaX0ofUbVzOPZlIlfTju2p4JgN321Gzw4VFT5DKFhBNQ5tnm2Mf05+d0+BX2FvIlZcwt4r+NUmQSaOytBEQhhz67xWD0wMEDcjt4fYHittg7Vx9F0Fss3Czstq/FIjtgEd8og+1Ymt5wuGMafl6SH1IIHsT3+eAkjCaqFRNg36gLcKMWAOtE8tyMePVo9ZFGZHNA70nbPfbs8SimPuFdJpD9ZIbFKvOEdUwHoE3JfzvcekF4123LSWCGccatQ+zuFe3IbiRnk3QzDjIiH7b7yMpIqPliTo0GkMRenMWdYtrsoNbZhH/KHNGnvcVM6uPZZHL+Zdtpw+R6cfbja5ZcunHCxpEJatO0v0KdStPkFjqPpB49Oj6+NOItSismbYuVv2jTeEPeByxAZSLil7F6bBA8CpMlKLqGwrL9jL9AFHQ9L4EYfp4WsDROOZgaqR0177dG7RlLl2q1G86K4qO6l5tpNbsL5/YADB6yPlCHzC08W+P6OqiKpWEzqTx3Ob1r+cKmA/8+8WdtFaMRWmPeFMzsnzSGWvP09Bl0UDSqAkpVila6iOXct6v8dDlFfXjxhPod/jI+neOsmUdQy92j+r+Vt+1Wav2knLqSogvKPwFZ7Wafs4I9wZDkn1iSxFHU8rWnIvwph4Xllb/GvZZqnfKB+FKpfRTVWrm+vPIBcis+SgP5Z46hNnPIykGlNerY9uAlErNBcWv4lb6sDyhZP60QDPg5jgOccdo2G0KlQ+aeX5+5vqakHUB4v4dW7JjqHVYUWGBjjKPWLQeX/6JW3CSrF9dRK9TeUX1lV07LkSbfi95jjtS2X2FRuqKd0E//EtJI51Zgh6Yf/EKtrCiKKgNXVbNbMfuz4jgG1zhe1H+bFaqcno6SItSKxtXPaC+1C51WDJC5YoMGZnW8JP5k1hfa32dhxg00ckCDERciYixWF19uORhzoB3jqbayt9+VWhdcvkeLjxU9lxR0FVvZMfrdImoPsFj2ti7aVhQ22cDdgfXITvHqfQRu/mBxzjNytlcleVdagzvUGTzw0Hp43ie6JLyx+JZBJMr4LYPB+K9DwxLhxWudfmTH9p/G0x1xWu2Nfjg/yHr9aLk5hNdq2pU8Kup29Tt4EBZ07GJS2j+b1KOhdbPoetvMIlpVNtp5umP3WZL6OIp3PTRVbOrK7UcdSojbcObcaHAAHukLfjajHdcPqmBPeOmErDxycwX1aiWPeD3yzLUDLOvJYDAY0+D33wKzm6OuAueto6JjtUE6aNlPMxna4s1kJoDTEs3uenNUKqAc37gp6vmiRA/EM1Bn9hjf7fCWkhgKROWu0wk0tWMfWp8yHnn9uQXWz8eU71mDnW17is0tx5QGEFOw+hlb0RusZnFKjVFl61xErnwm1WFNxP3e/RoYTz4l2tFsOUSx5+YSB7EFp9mmCOvYs4wOKY7WQhZtMBiMWdG601myRkjLKC42N+jOFKkbqces4CSkN0aYg6lMkiK1e3jVKTECcgBWzH8PSS8alq9Ft9+nnInNL8aYZ6F+j3+wgU6q5XihbfHXwmOzVaNyZHC8W+dLpKgtpllgRbrSeeyNlsa5O7oKWptfx2Mzf+yicnfRbXeeefzmU3gF9NjZ8rh7ZCjb9ioAGa8R0sYt01Z7HKzjv6trv2G1IGK8bn3lANyJe+px3q7j8QCLzfTXYrdBMXrMlu9b/+UTJLbrksH4zUibtyNeulOxrF/Bg7e5IfP0b06gotmr28oeygZ3qLX6G3u+WYPhARAtDpvHAgyUgOpQa596f5LTnPJ2+0CBk4VoDxQEdai9tuefG/hvHLCk24nuQ65WbUvXyR+V+tjtp55s4rZnPiJXm7b9Fvv0Uf3svmVDOMdtXzcC/h1Qrd82lNSfD0fHvUUuP1A5Fg8ko3XEbj49VVIkR/LyIh2mNI8H/HLR0m2PQ/iqhuDcwPdABpcHYeM8goIgPP272dFP4CeK7aEuj6GCtqIusBigQl2yLH3IQndSOq74RX//mUG90ew3cEzD8FmgyfgvI4p0hbay79s5PjTsfHnHtnMzH0TXCG7hs3uttQ6HT8p+eDas9Dgcc/L95zrYXHLuUK3B67pufiFbOiciJqyCy1c9U/uNpmb1b9Rqeov4cIgzQ70bxlnpi54Qppk87yVgs6V+cvQC6A4rpgZuSvb8xGpvpI6QHzgsnByl2JUJpwkhDZchpNxM6IK8IGhitaRCHjUPJ5RlVHAmWHkT2CncQjutWofkfq0bA11a5Hs1T/nPkOf9LEiQDz/WxGpJFVVymrleX+vNsWJzkU1dEIQAWKYg6ALn/Mn3yTvutGpVQBhjFlxkEDU3Iwu04I0jcrKbmV+w9/1nuV2Q9e7bB0HmP7Mnmcv4GaQ9/xo9s77exfMOTwd9AeB1TUZWiBIRoiUV2SP7PD+/srdmbdcCMPG5nuaK4MNaiAZE7ckNIH55PpiyAq4CNvNvJkF4qhXSbUEKZzjJi9LMrimP75iiY2Ekt8XT0suITWiNPBiMyeDnrq0m4pIqV22Lu/UoVZgcIyG4VfB4vR2NarWQYHfcmKNT7YaUwz74dKqVSDUE+bRFo1piRdUOBtwUqjVIFVVSfvQUhWqJFVVaBH9SqPZCyq888jof+tQapDC3LGWkT62zIRjbMr9En9p3MLXj8bvUaqOWnjGoQiRYW4Haw5DuzRXoljJrCvCjxkPSskjmC/RdAIZwXFd5qh7c8khZKkMnbG04VMl8C0y8ntTFftnM0z3LMgLQoxh3Qm6HRuZeRDqHA2bcldmkQy23ouI4ogqbcFkt7MqWVJUtmoRRNssx/f0gbPYY56jPQbCSZqlTj60vc2E3jZScUJlazCGskPXZRcBgzId8eLW34o002U66ItoK36ijFEOS4xWMujeoLwS1S6Kb+Ji4vIdIb7U6DccX9lbL3Zfjq+miv1q1tQR8Ovqr5XbhUCW+f80HaqX544gP1Nan988HWa1DDG9eL2o2PWS1QUL80p25L47c0hMCsgFw6VTLaR6NLm7rKKPyRJ/mcWnG9TKLkl6ojW+cp7JZfyFfPupme1T43O3g/fbFnjrLd+pX01cB4jbhtaribRklXuc+Ce/VOt+NohDB0qzywfUwWxs/4L1aLn3JMcmXJFmer0WTC+93p44AplZqXLzbwgXx0QP+PcE5n0Dk7dQuJKbWTBqm9oFNFdWKhAqvb8qJh6lP3MPUEja9YOeuqnVP0fId05upV4ExtTHBBKC7hPd1wT0Py6/mbVuHdMSpgFyJSKgtrKh9wV48/plPOIhagWxdL62RuUDabjAqtVrDbtniLj3aJoHH5M5arVbcfPq1agNtd/6ApjfeG3/6sGfuw4s/w/ApdxJ/M2Wk8zvCm7Lfyn86piUJsRgyaTfPJJQ2Qd62H/1WcH36W9psR0n3Vhv8qQ3WYrZcY2+1XO3CmNFs+aX+au2ozDzs5ysI6K+2uhKjmMy3XNJfrVkGPfrPfPm8/mr1sm2Pna8cj/5qy8NileuMi5L91XqFN+tPcKRtK73V8lFRd3Wds+Kqt9rZr+IB6atWPtLgWVZqo662pWIZQt7k06h0o6kAkDE59ZU8+O4Dm6Tg2XWDWVL+1ypNFySdo0hHkqNOMxk5AcjFvzvNqY4cEmfPcZUfpGhc6syCoGovc5QE7b6fX27Uld1E1U58CEWOtESyxbttx6sRtcocK/8BWjRlk66AgIKo3c9xFZoQdf7sPx2vfqrt4V4Ozx0bWOsuv/Wp1p48y9w44rP/KFOGOru2P3qEb9DhO6+Zp+dnKgFTTt5d3G4cdgdcnde5mGQoOaI0xBmSH/Iy0VopFf5rT4xfkRBlMBgMBoPBYDAYDMZE/A+6c7I2cil+1QAAAABJRU5ErkJggg==" style="max-width: 100%; height: auto; display: block;">
							<div class="thumbnail_label_cover">
								<div class="thumbnail_label">재생중</div>
							</div>
						</div>
						<div class="list_content_title">강의 소개</div>
						<div class="list_content_runtime">02:52</div>
					</div>
					<div class="list">
						<div class="list_thumbnail">
							<img src="data:image/png;base64,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" style="max-width: 100%; height: auto; display: block;">
							<div class="thumbnail_label_cover">
								<div class="thumbnail_label">재생중</div>
							</div>
						</div>
						<div class="list_content_title">강의 소개</div>
						<div class="list_content_runtime">02:52</div>
					</div>
					<div class="list">
						<div class="list_thumbnail">
							<img src="data:image/png;base64,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" style="max-width: 100%; height: auto; display: block;">
							<div class="thumbnail_label_cover">
								<div class="thumbnail_label">재생중</div>
							</div>
						</div>
						<div class="list_content_title">강의 소개</div>
						<div class="list_content_runtime">02:52</div>
					</div>
					<div class="list">
						<div class="list_thumbnail">
							<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK0AAAEjCAMAAAB3vHFtAAAAilBMVEX///8AAAD3+Pjs7OzZ2dn7+/v19fXx8fHk5OTr6+tMTExISEi/v7/W1taYmJj5+fmHh4dnZ2fg4OA5OTnIyMijo6OQkJC6urqxsbF1dXWZmZlcXFyrq6tqamrLy8tDQ0MwMDBUVFQQEBAlJSUZGRl4eHg1NTWJiYmAgIA+Pj4eHh5gYGAUFBQjIyM0J+lJAAAMwUlEQVR4nO2diZqivBKGSbMriCIIKLKIG23P/d/eIWwmEgRnWNL/yfvM045rfx2TSlWlEriv3wTHYDAYDAaD8X+FJMsyvOXnFlKh3UpceG9/W+fcLXhPis9/gMFxCvxBBfdkl4td52qTeL+C7ILsjsErGbyRqZVmVllx99B7iY3c0cJ4uYxDlya1R/Re4lk5mp7dkRT5GqmKRJPaRVAIhPo471Cyzp/kAdA4jiK19mKZE17ExnNS6NlAp0ktyg0gWKIDYo5zwdGgRa2VLmpC90vhZZk/3DIzqyqGkfqwuRWfmrZVtQxrEVvwVsn6xW63SxbZj6B6hbJTqVFbcLxU/8uU3nbZP7CqHvGBM4+oVja1za3s7XVfPsBHaUTNvFuAqD06EA0Uag0bHMU78GnqCIja2t7m87B9CuGtGwJ3Nm1NBJP8uGQZ5S1VjctgMMbFuT3SdHv8FeNefsS+rpimgj3qbNWZ9LzH80iPmgmdciOF+LC0BOQnZkWJW/qrukjlaaX0ofUbVzOPZlIlfTju2p4JgN321Gzw4VFT5DKFhBNQ5tnm2Mf05+d0+BX2FvIlZcwt4r+NUmQSaOytBEQhhz67xWD0wMEDcjt4fYHittg7Vx9F0Fss3Czstq/FIjtgEd8og+1Ymt5wuGMafl6SH1IIHsT3+eAkjCaqFRNg36gLcKMWAOtE8tyMePVo9ZFGZHNA70nbPfbs8SimPuFdJpD9ZIbFKvOEdUwHoE3JfzvcekF4123LSWCGccatQ+zuFe3IbiRnk3QzDjIiH7b7yMpIqPliTo0GkMRenMWdYtrsoNbZhH/KHNGnvcVM6uPZZHL+Zdtpw+R6cfbja5ZcunHCxpEJatO0v0KdStPkFjqPpB49Oj6+NOItSismbYuVv2jTeEPeByxAZSLil7F6bBA8CpMlKLqGwrL9jL9AFHQ9L4EYfp4WsDROOZgaqR0177dG7RlLl2q1G86K4qO6l5tpNbsL5/YADB6yPlCHzC08W+P6OqiKpWEzqTx3Ob1r+cKmA/8+8WdtFaMRWmPeFMzsnzSGWvP09Bl0UDSqAkpVila6iOXct6v8dDlFfXjxhPod/jI+neOsmUdQy92j+r+Vt+1Wav2knLqSogvKPwFZ7Wafs4I9wZDkn1iSxFHU8rWnIvwph4Xllb/GvZZqnfKB+FKpfRTVWrm+vPIBcis+SgP5Z46hNnPIykGlNerY9uAlErNBcWv4lb6sDyhZP60QDPg5jgOccdo2G0KlQ+aeX5+5vqakHUB4v4dW7JjqHVYUWGBjjKPWLQeX/6JW3CSrF9dRK9TeUX1lV07LkSbfi95jjtS2X2FRuqKd0E//EtJI51Zgh6Yf/EKtrCiKKgNXVbNbMfuz4jgG1zhe1H+bFaqcno6SItSKxtXPaC+1C51WDJC5YoMGZnW8JP5k1hfa32dhxg00ckCDERciYixWF19uORhzoB3jqbayt9+VWhdcvkeLjxU9lxR0FVvZMfrdImoPsFj2ti7aVhQ22cDdgfXITvHqfQRu/mBxzjNytlcleVdagzvUGTzw0Hp43ie6JLyx+JZBJMr4LYPB+K9DwxLhxWudfmTH9p/G0x1xWu2Nfjg/yHr9aLk5hNdq2pU8Kup29Tt4EBZ07GJS2j+b1KOhdbPoetvMIlpVNtp5umP3WZL6OIp3PTRVbOrK7UcdSojbcObcaHAAHukLfjajHdcPqmBPeOmErDxycwX1aiWPeD3yzLUDLOvJYDAY0+D33wKzm6OuAueto6JjtUE6aNlPMxna4s1kJoDTEs3uenNUKqAc37gp6vmiRA/EM1Bn9hjf7fCWkhgKROWu0wk0tWMfWp8yHnn9uQXWz8eU71mDnW17is0tx5QGEFOw+hlb0RusZnFKjVFl61xErnwm1WFNxP3e/RoYTz4l2tFsOUSx5+YSB7EFp9mmCOvYs4wOKY7WQhZtMBiMWdG601myRkjLKC42N+jOFKkbqces4CSkN0aYg6lMkiK1e3jVKTECcgBWzH8PSS8alq9Ft9+nnInNL8aYZ6F+j3+wgU6q5XihbfHXwmOzVaNyZHC8W+dLpKgtpllgRbrSeeyNlsa5O7oKWptfx2Mzf+yicnfRbXeeefzmU3gF9NjZ8rh7ZCjb9ioAGa8R0sYt01Z7HKzjv6trv2G1IGK8bn3lANyJe+px3q7j8QCLzfTXYrdBMXrMlu9b/+UTJLbrksH4zUibtyNeulOxrF/Bg7e5IfP0b06gotmr28oeygZ3qLX6G3u+WYPhARAtDpvHAgyUgOpQa596f5LTnPJ2+0CBk4VoDxQEdai9tuefG/hvHLCk24nuQ65WbUvXyR+V+tjtp55s4rZnPiJXm7b9Fvv0Uf3svmVDOMdtXzcC/h1Qrd82lNSfD0fHvUUuP1A5Fg8ko3XEbj49VVIkR/LyIh2mNI8H/HLR0m2PQ/iqhuDcwPdABpcHYeM8goIgPP272dFP4CeK7aEuj6GCtqIusBigQl2yLH3IQndSOq74RX//mUG90ew3cEzD8FmgyfgvI4p0hbay79s5PjTsfHnHtnMzH0TXCG7hs3uttQ6HT8p+eDas9Dgcc/L95zrYXHLuUK3B67pufiFbOiciJqyCy1c9U/uNpmb1b9Rqeov4cIgzQ70bxlnpi54Qppk87yVgs6V+cvQC6A4rpgZuSvb8xGpvpI6QHzgsnByl2JUJpwkhDZchpNxM6IK8IGhitaRCHjUPJ5RlVHAmWHkT2CncQjutWofkfq0bA11a5Hs1T/nPkOf9LEiQDz/WxGpJFVVymrleX+vNsWJzkU1dEIQAWKYg6ALn/Mn3yTvutGpVQBhjFlxkEDU3Iwu04I0jcrKbmV+w9/1nuV2Q9e7bB0HmP7Mnmcv4GaQ9/xo9s77exfMOTwd9AeB1TUZWiBIRoiUV2SP7PD+/srdmbdcCMPG5nuaK4MNaiAZE7ckNIH55PpiyAq4CNvNvJkF4qhXSbUEKZzjJi9LMrimP75iiY2Ekt8XT0suITWiNPBiMyeDnrq0m4pIqV22Lu/UoVZgcIyG4VfB4vR2NarWQYHfcmKNT7YaUwz74dKqVSDUE+bRFo1piRdUOBtwUqjVIFVVSfvQUhWqJFVVaBH9SqPZCyq888jof+tQapDC3LGWkT62zIRjbMr9En9p3MLXj8bvUaqOWnjGoQiRYW4Haw5DuzRXoljJrCvCjxkPSskjmC/RdAIZwXFd5qh7c8khZKkMnbG04VMl8C0y8ntTFftnM0z3LMgLQoxh3Qm6HRuZeRDqHA2bcldmkQy23ouI4ogqbcFkt7MqWVJUtmoRRNssx/f0gbPYY56jPQbCSZqlTj60vc2E3jZScUJlazCGskPXZRcBgzId8eLW34o002U66ItoK36ijFEOS4xWMujeoLwS1S6Kb+Ji4vIdIb7U6DccX9lbL3Zfjq+miv1q1tQR8Ovqr5XbhUCW+f80HaqX544gP1Nan988HWa1DDG9eL2o2PWS1QUL80p25L47c0hMCsgFw6VTLaR6NLm7rKKPyRJ/mcWnG9TKLkl6ojW+cp7JZfyFfPupme1T43O3g/fbFnjrLd+pX01cB4jbhtaribRklXuc+Ce/VOt+NohDB0qzywfUwWxs/4L1aLn3JMcmXJFmer0WTC+93p44AplZqXLzbwgXx0QP+PcE5n0Dk7dQuJKbWTBqm9oFNFdWKhAqvb8qJh6lP3MPUEja9YOeuqnVP0fId05upV4ExtTHBBKC7hPd1wT0Py6/mbVuHdMSpgFyJSKgtrKh9wV48/plPOIhagWxdL62RuUDabjAqtVrDbtniLj3aJoHH5M5arVbcfPq1agNtd/6ApjfeG3/6sGfuw4s/w/ApdxJ/M2Wk8zvCm7Lfyn86piUJsRgyaTfPJJQ2Qd62H/1WcH36W9psR0n3Vhv8qQ3WYrZcY2+1XO3CmNFs+aX+au2ozDzs5ysI6K+2uhKjmMy3XNJfrVkGPfrPfPm8/mr1sm2Pna8cj/5qy8NileuMi5L91XqFN+tPcKRtK73V8lFRd3Wds+Kqt9rZr+IB6atWPtLgWVZqo662pWIZQt7k06h0o6kAkDE59ZU8+O4Dm6Tg2XWDWVL+1ypNFySdo0hHkqNOMxk5AcjFvzvNqY4cEmfPcZUfpGhc6syCoGovc5QE7b6fX27Uld1E1U58CEWOtESyxbttx6sRtcocK/8BWjRlk66AgIKo3c9xFZoQdf7sPx2vfqrt4V4Ozx0bWOsuv/Wp1p48y9w44rP/KFOGOru2P3qEb9DhO6+Zp+dnKgFTTt5d3G4cdgdcnde5mGQoOaI0xBmSH/Iy0VopFf5rT4xfkRBlMBgMBoPBYDAYDMZE/A+6c7I2cil+1QAAAABJRU5ErkJggg==" style="max-width: 100%; height: auto; display: block;">
							<div class="thumbnail_label_cover">
								<div class="thumbnail_label">재생중</div>
							</div>
						</div>
						<div class="list_content_title">강의 소개</div>
						<div class="list_content_runtime">02:52</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>	