CREATE TABLE nba_2024_per_game (
    Rk INT,
    Player VARCHAR(100),
    Age INT,
    Team VARCHAR(10),
    Pos VARCHAR(5),
    G INT,
    GS INT,
    MP FLOAT,
    FG FLOAT,
    FGA FLOAT,
    FG_PCT FLOAT,
    ThreeP FLOAT,
    ThreePA FLOAT,
    ThreeP_PCT FLOAT,
    TwoP FLOAT,
    TwoPA FLOAT,
    TwoP_PCT FLOAT,
    eFG_PCT FLOAT,
    FT FLOAT,
    FTA FLOAT,
    FT_PCT FLOAT,
    ORB FLOAT,
    DRB FLOAT,
    TRB FLOAT,
    AST FLOAT,
    STL FLOAT,
    BLK FLOAT,
    TOV FLOAT,
    PF FLOAT,
    PTS FLOAT
);

SELECT *
FROM nba_2024_per_game;

--Top 10 scorers
SELECT player,
       MAX(team) AS team,
       MAX(pts)  AS pts
FROM nba_2024_per_game
GROUP BY player
ORDER BY MAX(pts) DESC
LIMIT 10;

--Most Efficient Scorers (All FG)
SELECT player, team, fg_pct, threep_pct, ft_pct
FROM nba_2024_per_game
WHERE fga > 10  -- filters out bench players
ORDER BY fg_pct DESC
LIMIT 10;

--Most efficient 3 point shooters
SELECT player, team, threep_pct, threep ,threepa
FROM nba_2024_per_game
WHERE threepa >= 8 AND g >65
ORDER BY threep_pct DESC
LIMIT 10;

--Most assist per game
SELECT player, team, ast
FROM nba_2024_per_game
ORDER BY ast DESC
LIMIT 10;

--Most rebounds per game
SELECT player, team, trb
FROM nba_2024_per_game
ORDER BY trb DESC
LIMIT 10;

--Best Two Way players
SELECT
    player,
    team,
    ROUND(pts + trb + ast) AS total_contrib
FROM nba_2024_per_game
ORDER BY total_contrib DESC
LIMIT 10;

--A players prime age
SELECT
    age,
    COUNT(*) AS num_players,
    ROUND(AVG(pts + trb + ast)::numeric, 1) AS avg_total_contrib
FROM nba_2024_per_game
GROUP BY age
HAVING COUNT(*) >= 10
ORDER BY avg_total_contrib DESC;

--Best offensive Team
SELECT
    team,
    ROUND(SUM(pts)) AS team_ppg,
    ROUND(SUM(ast)) AS team_apg,
    ROUND(SUM(fg)) AS team_fgm,
    ROUND(SUM(fga)) AS team_fga,
    ROUND((SUM(fg) / SUM(fga)) * 100) AS fg_pct_team
FROM nba_2024_per_game
GROUP BY team
ORDER BY team_ppg DESC;


--Most efficient Player Overall
SELECT player, team,
       ROUND(((pts + trb + ast + stl + blk) / (fga + 0.5 * fta + tov + 1))) AS efficiency_score
FROM nba_2024_per_game
WHERE fga > 10
ORDER BY efficiency_score DESC
LIMIT 10;

--Ranking Most PPG
SELECT
    player,
    team,
    pts,
    RANK() OVER (ORDER BY pts DESC) AS scoring_rank
FROM nba_2024_per_game
ORDER BY scoring_rank
LIMIT 10;

--Ranking Most APG
SELECT
    player,
    team,
    ast,
    RANK() OVER (ORDER BY ast DESC) AS assist_rank
FROM nba_2024_per_game
ORDER BY assist_rank
LIMIT 10;

--Combined Ranking (Across PTS, REB, AST)
SELECT
    player,
    team,
    pts,
    trb,
    ast,
    (RANK() OVER (ORDER BY pts DESC) +
     RANK() OVER (ORDER BY trb DESC) +
     RANK() OVER (ORDER BY ast DESC)) AS total_rank
FROM nba_2024_per_game
ORDER BY total_rank
LIMIT 10;

--Per 36 min Top 10 Players
SELECT
    player,
    team,
    ROUND((pts / mp) * 36) AS pts_per_36,
    ROUND((trb / mp) * 36) AS reb_per_36,
    ROUND((ast / mp) * 36) AS ast_per_36,
    RANK() OVER (ORDER BY (pts / mp) * 36 DESC) AS rank
FROM nba_2024_per_game
WHERE mp > 10
ORDER BY rank
LIMIT 10;





