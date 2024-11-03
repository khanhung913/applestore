<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Contact</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
            </head>

            <body>


                <div class="auth-form vh-100">
                    <div class="contact-form-wrapper d-flex justify-content-center opacity-85">
                        <form action="#" class="contact-form">
                            <h3 class="title mb-5 mt-3">お問い合わせ</h3>
                            <p class="description">サポートが必要な場合、サポートが必要な場合、またはその他の質問がある場合はお気軽にお問い合わせください。
                            </p>
                            <div>
                                <input type="text" class="form-control rounded border-white mb-3 form-input" id="name"
                                    placeholder="名前" required>
                            </div>
                            <div>
                                <input type="email" class="form-control rounded border-white mb-3 form-input"
                                    placeholder="メール" required>
                            </div>
                            <div>
                                <textarea id="message" class="form-control rounded border-white mb-3 form-text-area"
                                    rows="5" cols="30" placeholder="メッセージ" required></textarea>
                            </div>
                            <div class="submit-button-wrapper">
                                <input type="submit" value="送信">
                            </div>
                        </form>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>