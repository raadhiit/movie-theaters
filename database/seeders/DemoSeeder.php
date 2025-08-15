<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Theater;
use App\Models\Auditorium;
use App\Models\Seat;
use App\Models\Movie;
use App\Models\Screening;
use App\Models\Customer;

class DemoSeeder extends Seeder
{
    public function run(): void
    {
        $this->command->info('Seeding started');

        // 1) Admin user
        User::firstOrCreate(
            ['email' => 'admin@example.com'],
            ['name' => 'Admin', 'password' => bcrypt('password')]
        );
        $this->command->info('Users done');

        // 2) Theater + Auditoriums
        $theater = Theater::firstOrCreate(['name' => 'Central Cineplex']);
        $a1 = Auditorium::firstOrCreate(['theater_id' => $theater->id, 'name' => 'Auditorium 1']);
        $a2 = Auditorium::firstOrCreate(['theater_id' => $theater->id, 'name' => 'Auditorium 2']);
        $this->command->info('Theater & Auditoriums done');

        // 3) Seats (bulk insert)
        foreach ([$a1, $a2] as $aud) {
            if (!Seat::where('auditorium_id', $aud->id)->exists()) {
                $bulk = [];
                foreach (range('A', 'J') as $row) {
                    foreach (range(1, 10) as $num) {
                        $bulk[] = [
                            'auditorium_id' => $aud->id,
                            'row_label'     => $row,
                            'seat_number'   => $num,
                            'created_at'    => now(),
                            'updated_at'    => now(),
                        ];
                    }
                }
                Seat::insert($bulk);
                $this->command->info("Seats for {$aud->name} inserted");
            }
        }

        // 4) Movies
        $this->command->info('Seeding: movies');
        try {
            $m1 = Movie::updateOrCreate(
                ['name' => 'The Great Escape'],
                ['duration_min' => 120]
            );
            $m2 = Movie::updateOrCreate(
                ['name' => 'Ocean Deep'],
                ['duration_min' => 95]
            );
            $this->command->info('Movies done');
        } catch (\Throwable $e) {
            $this->command->error('Movies error: ' . $e->getMessage());
            throw $e;
        }

        // 5) Screenings
        foreach ([$a1, $a2] as $aud) {
            Screening::firstOrCreate([
                'movie_id'      => $m1->id,
                'auditorium_id' => $aud->id,
                'start_time'    => now()->addHours(3)->seconds(0)
            ]);
            Screening::firstOrCreate([
                'movie_id'      => $m2->id,
                'auditorium_id' => $aud->id,
                'start_time'    => now()->addDay()->setTime(19, 30)->seconds(0)
            ]);
        }
        $this->command->info('Screenings done');

        // 6) Customers
        Customer::firstOrCreate(['email' => 'john@example.com'], ['name' => 'John Doe']);
        $this->command->info('Customers done');

        $this->command->info('Seeding finished!');
    }
}
