<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>صفحه اصلی Nginx</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 50px;
        }
        h1 {
            color: #007BFF;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>به صفحه اصلی Nginx خوش آمدید</h1>
        <p>این صفحه شامل اطلاعات مفیدی برای توسعه‌دهندگان وب است.</p>
        
        <h2>اطلاعات PHP</h2>
        <table>
            <tr>
                <th>ویژگی</th>
                <th>مقدار</th>
            </tr>
            <tr>
                <td>نسخه PHP</td>
                <td><?php echo phpversion(); ?></td>
            </tr>
            <tr>
                <td>سیستم عامل</td>
                <td><?php echo PHP_OS; ?></td>
            </tr>
            <tr>
                <td>سرور</td>
                <td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
            </tr>
            <tr>
                <td>آدرس IP سرور</td>
                <td><?php echo $_SERVER['SERVER_ADDR']; ?></td>
            </tr>
            <tr>
                <td>نام سرور</td>
                <td><?php echo $_SERVER['SERVER_NAME']; ?></td>
            </tr>
            <tr>
                <td>آدرس IP کلاینت</td>
                <td><?php echo $_SERVER['REMOTE_ADDR']; ?></td>
            </tr>
        </table>

        <h2>متغیرهای محیطی</h2>
        <table>
            <tr>
                <th>متغیر</th>
                <th>مقدار</th>
            </tr>
            <?php foreach ($_SERVER as $key => $value): ?>
                <tr>
                    <td><?php echo htmlspecialchars($key); ?></td>
                    <td><?php echo htmlspecialchars($value); ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
</body>
</html>